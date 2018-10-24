within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicReaction "basic declaration of a reaction "
  extends Interfaces.Dynamic.ReactionConnections; 

  replaceable model Modifiers = ModifiersTerm   constrainedby ModifiersTerm;
  extends Modifiers;

  Units.VolumetricReactionRate v "Reaction Rate";
  // Connections to Substrates and Products

equation

  for i in 1:NS loop
    rc_S[i].r = n_S[i] * v;
  end for;
  for i in 1:NP loop
    rc_P[i].r = -n_P[i] * v;
  end for;

end BasicReaction;
