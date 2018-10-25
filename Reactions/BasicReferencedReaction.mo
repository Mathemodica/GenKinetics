within GenKinetics.Reactions;
model BasicReferencedReaction
  "Basic Reaction referenced from its steady-state"
  extends BasicReaction;

  parameter Units.VolumetricReactionRate v_steady  "Reaction rate at a reference steady-state";

end BasicReferencedReaction;
