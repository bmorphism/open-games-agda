{-# OPTIONS --safe #-}
module Games.Core.Lens where

open import Level
open import Data.Product
open import Relation.Binary.PropositionalEquality as Eq
open import Function using (id; _∘_)

-- A lens from S to A is a way to:
-- 1. Get an A from an S
-- 2. Update an S given an A
record Lens {ℓ} (S A : Set ℓ) : Set ℓ where
  constructor lens
  field
    view : S → A  
    update : S → A → S
    -- Laws:
    law₁ : ∀ s → update s (view s) ≡ s
    law₂ : ∀ s a → view (update s a) ≡ a
    law₃ : ∀ s a₁ a₂ → update (update s a₁) a₂ ≡ update s a₂

open Lens public

-- Identity lens
idLens : ∀ {ℓ} {A : Set ℓ} → Lens A A
idLens = lens id (λ _ x → x) (λ _ → refl) (λ _ _ → refl) λ _ _ _ → refl

-- Lens composition
_∘L_ : ∀ {ℓ} {A B C : Set ℓ} → Lens B C → Lens A B → Lens A C
(l₁ ∘L l₂) .view = view l₁ ∘ view l₂
(l₁ ∘L l₂) .update s c = update l₂ s (update l₁ (view l₂ s) c)
(l₁ ∘L l₂) .law₁ s = begin
  update l₂ s (update l₁ (view l₂ s) (view l₁ (view l₂ s)))
    ≡⟨ cong (update l₂ s) (law₁ l₁ (view l₂ s)) ⟩
  update l₂ s (view l₂ s)
    ≡⟨ law₁ l₂ s ⟩
  s ∎
  where open ≡-Reasoning
(l₁ ∘L l₂) .law₂ s c = begin
  view l₁ (view l₂ (update l₂ s (update l₁ (view l₂ s) c)))
    ≡⟨ cong (view l₁) (law₂ l₂ s (update l₁ (view l₂ s) c)) ⟩
  view l₁ (update l₁ (view l₂ s) c)
    ≡⟨ law₂ l₁ (view l₂ s) c ⟩
  c ∎
  where open ≡-Reasoning
(l₁ ∘L l₂) .law₃ s c₁ c₂ = {!!}  -- TODO: Complete this proof
