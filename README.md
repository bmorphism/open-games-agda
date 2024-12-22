# Open Games in Agda

A formal development of compositional game theory using dependent types in Agda. This repository provides a categorical foundation for open games, building on lenses and Markov categories.

## Core Concepts

1. **Lenses and Optics** - Fundamental building blocks for composable state manipulation
2. **Markov Categories** - Categorical semantics for probabilistic computations
3. **Open Games** - Games as morphisms with composable strategies
4. **Equilibria** - Nash equilibria and best response maps in a categorical setting

## Project Structure

```
src/
  Games/
    Core/
      Lens.agda        -- Basic lens definitions
      Optic.agda       -- General optic framework
      Category.agda    -- Category theory foundations
    Markov/
      Core.agda        -- Markov category definition
      Composition.agda -- Composition of Markov kernels
    OpenGames/
      Definition.agda  -- Core open game definition
      Composition.agda -- Game composition
      Examples/
        Matching.agda  -- Matching game examples
        Bargaining.agda -- Bargaining game examples
    Equilibrium/
      Nash.agda        -- Nash equilibrium definition
      BestResponse.agda -- Best response maps
```

## Getting Started

This development requires:
- Agda 2.6.3 or later
- Standard library version 1.7.2 or later

To build:
```bash
agda --safe src/Games/OpenGames/Definition.agda
```

## References

1. Hedges, J. (2018). Morphisms of open games
2. Ghani, N., et al. (2018). Compositional game theory
3. Fritz, T. (2020). A synthetic approach to Markov kernels, conditional independence and theorems on sufficient statistics

## Contributing

See CONTRIBUTING.md for guidelines on how to contribute to this formalization.
