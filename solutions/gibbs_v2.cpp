#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix gibbs_cpp(int N, int thin) {
  NumericMatrix mat(N, 2);
  double x = 0, y = 0;
  
  for(int i = 0; i < N; i++) {
    for(int j = 0; j < thin; j++) {
      x = R::rgamma(3, 1 / (y * y + 4));
      y = R::rnorm(1 / (x + 1), 1 / sqrt(2 * (x + 1)));
    }
    mat(i, _) = NumericVector::create(x,y);
  }
  
  return(mat);
}
