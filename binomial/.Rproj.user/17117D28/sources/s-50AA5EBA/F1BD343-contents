library(testthat)
test_file('tests/testthat/test-binomial-functions.R')
test_file('tests/testthat/test-check-functions.R')
test_file('tests/testthat/test-summary-measures.R')

# private auxillary function to test if the input p is between 0 and 1
check_prob <- function(prob){
  if(prob >= 0 & prob <= 1) {
    return(TRUE)
  } else {
    stop('invalid prob value')
  }
}

# private auxillary function to test if trials is a non-negative integer
check_trials <- function(trials){
  if(trials >= 0) {
    return(TRUE)
  } else {
    stop('invalid trials value')
  }
}

# private auxillary function to test if success is between 0 and the number of trials
check_success <- function(success, trials){
  if(success >= 0 & success <= trials) {
    return(TRUE)
  } else if(success > trials) {
    stop('success cannot be greater than trials')
  } else {
    stop('invalid success value')
  }
}

# private auxillary function to calculate the mean
aux_mean <- function(trials, prob){
  return(trials * prob)
}

# private auxillary function to calculate the variance
aux_variance <- function(trials, prob){
  return(trials * prob * (1 - prob))
}

# private auxillary function to calculate the mode
aux_mode <- function(trials, prob){
  return(as.integer(trials * prob + prob))
}

# private auxillary function to calculate the skewness
aux_skewness <- function(trials, prob){
  skewness <- (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(skewness)
}

# private auxillary function to calculate the kurtosis
aux_kurtosis <- function(trials, prob){
  kurtosis <- (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}

#' @title bin_choose()
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations
#' @export
#' @examples
bin_choose <- function(n, k){
  numerator <- factorial(n)
  denominator <- factorial(k) * factorial(n - k)
  comb <- numerator / denominator
  return(comb)
}

#' @title bin_probability()
#' @description calculates binomial probability given number of successes, trials, and probability
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability
#' @return binomial probability
#' @export
#' @examples
bin_probability <- function(successes, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(successes, trials)

  comb <- bin_choose(trials, successes)
  p <- prob ** successes
  q <- (1 - p) ** (trials - successes)
  return(comb * p * q)
}

#' @title bin_distribution()
#' @description constructs a data frame listing different number of successes and their corresponding probabilties
#' @param trials number of trials
#' @param prob probability
#' @return data frame of successes and probabilities
#' @export
#' @examples
bin_distribution <- function(trials, prob){
  successes <- 0:trials
  probs <- c()
  i <- 1
  for(s in successes){
    probs[i] <- bin_probability(s, trials, prob)
    i <- i + 1
  }
  dist <- data.frame('successes' = successes, 'probability' = probs)
  class(dist) <- c('bindis', 'data.frame')
  return(dist)
}

#NEEDS FIXING
#' @export
plot.bindis <- function(object){
  barplot(object$probability, xlab = 'successes', ylab = 'probability',
          names.arg = object$successes)
}

#' @title bin_cumulative()
#' @description create a data frame that also contains the cumulative probabilites
#' @param trials number of trials
#' @param prob probability
#' @return data frame containing successes, probabilities, and cumulative probabilites
#' @export
#' @example
bin_cumulative <- function(trials, prob){
  successes <- 0:trials
  cum_prob <- c()
  amount <- 0
  index <- 1
  for(s in successes){
    amount <- amount + bin_probability(s, trials, prob)
    cum_prob[index] <- amount
    index <- index + 1
  }

  binom_cum_dist <- bin_distribution(trials, prob)
  binom_cum_dist$cumulative <- cum_prob
  class(binom_cum_dist) <- c('bincum', 'data.frame')
  return(binom_cum_dist)
}

#NEEDS FIXING
#' @export
plot.bincum <- function(object){
  plot(x = object$successes, y = object$cumulative, type = 'o',
       xlab = 'successes', ylab = 'probability')
}

#' @title bin_variable()
#' @description creates a binomial random variable
#' @param trials number of trials
#' @param prob probability
#' @return binomial random variable object
#' @export
#' @examples
bin_variable <- function(trials, prob){
  vars <- list(trials, prob)
  names(vars) <- c('trials', 'prob')
  class(vars) <- 'binvar'
  return(vars)
}

#' @export
print.binvar <- function(object){
  cat('"Binomial Variable"\n')
  cat('\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials: %i', object$'trials'))
  cat('\n')
  cat(sprintf('- prob of success: %f', object$'prob'))
  invisible(object)
}

#' @export
summary.binvar <- function(object){
  trials <- object$'trials'
  prob <- object$'prob'
  list_data <- list(trials, prob, aux_mean(trials, prob), aux_variance(trials, prob),
                    aux_mode(trials, prob), aux_skewness(trials, prob),
                    aux_kurtosis(trials, prob))
  names(list_data) <- c('trials', 'prob', 'mean', 'variance', 'mode', 'skewness', 'kurtosis')
  class(list_data) <- 'summary.binvar'
  return(list_data)
}

#' @export
print.summary.binvar <- function(object){
  cat('"Summary Binomial"\n')
  cat('\n')
  cat('Parametes\n')
  cat(sprintf('- number of trials: %i', object$'trials'))
  cat('\n')
  cat(sprintf('- prob of success: %f', object$'prob'))
  cat('\n')
  cat('Measures\n')
  cat(sprintf('- mean: %f\n', object$'mean'))
  cat(sprintf('- variance: %f\n', object$'variance'))
  cat(sprintf('- mode: %f\n', object$'mode'))
  cat(sprintf('- skewness: %f\n', object$'skewness'))
  cat(sprintf('- kurtosis: %f\n', object$'kurtosis'))
}

#' @title bin_mean()
#' @description calculates the mean
#' @param trials number of trials
#' @param prob probability
#' @return mean
#' @export
#' @examples
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title bin_variance()
#' @description calculates the variance
#' @param trials number of trials
#' @param prob probability
#' @return variance
#' @export
#' @examples
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title bin_mode()
#' @description calculates the mode
#' @param trials number of trials
#' @param prob probability
#' @return mode
#' @export
#' @examples
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title bin_skewness()
#' @description calculates the skewness
#' @param trials number of trials
#' @param prob probability
#' @return skewness
#' @export
#' @examples
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title bin_kurtosis()
#' @description calculates the kurtosis
#' @param trials number of trials
#' @param prob probability
#' @return kurtosi
#' @export
#' @examples
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}


