#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double wmean_cpp(NumericVector x, NumericVector w) {
  int n = x.size();
  double total = 0, total_w = 0;
  for(int i = 0; i < n; ++i) {
    total += x[i] * w[i];
    total_w += w[i];
  }
  return total / total_w;
}
