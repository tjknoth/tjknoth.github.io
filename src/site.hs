--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend) 
import           Hakyll
import           Data.List.Split (splitOn)
import           Text.Pandoc.Options


--------------------------------------------------------------------------------
main :: IO ()
main = do
  deploy <- readFile "src/deployScript"
  hakyllWith (defaultConfiguration { deployCommand = deploy }) $ do

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "pages/*" $ do
        -- For example: route /pages/projects.md to /projects.html
        route   . customRoute $ (++ ".html") . head . splitOn "." . concat . tail . splitOn "/" . toFilePath
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match (fromGlob "posts/*" .&&. complement "posts/post_template.md") $ do
        route $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "publications/*.md" $ compile pandocCompiler

    match "teaching/**.md" $ do
      route $ setExtension "html"
      compile $ pandocCompiler 
          >>= loadAndApplyTemplate "templates/cse20.html" defaultContext
          >>= relativizeUrls

    match "teaching/*/raw/*" $ do
      route idRoute
      compile copyFileCompiler
   
    match "publications/*.pdf" $ do 
        route idRoute
        compile copyFileCompiler

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do 
          pubs <- loadAll "publications/*.md"
          let pubCtx = 
                listField "publications" defaultContext (return pubs) `mappend`
                defaultContext

          getResourceBody 
             >>= applyAsTemplate pubCtx
             >>= loadAndApplyTemplate "templates/default.html" pubCtx
             >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    match "raw/*" $ do
      -- route . customRoute $ concat . tail . (splitOn "/") . toFilePath
      route idRoute
      compile copyFileCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

pandocMathCompiler :: Compiler (Item String)
pandocMathCompiler = 
  let mathExts    = [ Ext_tex_math_dollars, 
                      Ext_tex_math_double_backslash,
                      Ext_latex_macros ]
      defaultExts = writerExtensions defaultHakyllWriterOptions
      newExts     = foldr enableExtension defaultExts mathExts
      writerOpts  = defaultHakyllWriterOptions {
                      writerExtensions = newExts,
                      writerHTMLMathMethod = MathJax ""
                    }
  in pandocCompilerWith defaultHakyllReaderOptions writerOpts
