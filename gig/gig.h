#ifndef GIG_H
#define GIG_H

#include <random>

namespace gig{
  class GIG_gen {
    private:
      std::mt19937_64 generator;

    public:
      GIG_gen() : generator() {}
      GIG_gen(unsigned int seed) : generator(seed) {}
      GIG_gen(std::mt19937_64 &generator) : generator(generator) {}
      double sample(double lambda, double chi, double psi);
    };
}
#endif
