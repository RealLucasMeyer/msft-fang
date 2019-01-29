library(quantmod)


# Get Prices
msft <- getSymbols("MSFT", auto.assign = FALSE)
fb   <- getSymbols("FB", auto.assign = FALSE)
amzn <- getSymbols("AMZN", auto.assign = FALSE)
nflx <- getSymbols("NFLX", auto.assign = FALSE)
goog <- getSymbols("GOOG", auto.assign = FALSE)
aapl <- getSymbols("AAPL", auto.assign = FALSE)

# Convert prices to returns
msft_ret <- 1 + dailyReturn(msft)
fb_ret   <- dailyReturn(fb)
aapl_ret <- dailyReturn(aapl)
amzn_ret <- dailyReturn(amzn)
nflx_ret <- dailyReturn(nflx)
goog_ret <- dailyReturn(goog)

# FANG portfolio
fang_ret <- 1 + (0.25 * fb_ret + 0.25 * amzn_ret + 0.25 * nflx_ret + 0.25 * goog_ret) 
faang_ret <- 1 + (0.2 * fb_ret + 0.2 * amzn_ret + 0.2 * nflx_ret + 0.2 * goog_ret + 0.2 * amzn_ret)

# Cumulative Returns
msft_cum_ret <- xts(rev(cumprod(rev(msft_ret))))
fang_cum_ret <- xts(rev(cumprod(rev(fang_ret))))
faang_cum_ret <- xts(rev(cumprod(rev(faang_ret))))

# Long-short portfolio
msft_fang_cum_ret <- fang_cum_ret - msft_cum_ret
msft_faang_cum_ret <- faang_cum_ret - msft_cum_ret

# plot
plot(msft_fang_cum_ret["2015-06/"])
plot(msft_faang_cum_ret["2015-06/"])

