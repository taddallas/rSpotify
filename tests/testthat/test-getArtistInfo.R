context("getArtistInfo")

test_that("get uri, followers, and popularity for a given artist", {
	queen <- getArtistInfo('Queen')
	expect_true(is.vector(queen))
	
})
