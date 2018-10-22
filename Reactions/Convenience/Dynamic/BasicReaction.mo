within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicReaction "basic declaration of a reaction "

  replaceable model Structure =
    Interfaces.Dynamic.Structure.ReactionStructure                             constrainedby
    Interfaces.Dynamic.Structure.ReactionStructure;
  extends Structure;

  replaceable model Modifier = BasicModifier                               constrainedby
    BasicModifier;
  extends Modifier;

  Units.VolumetricReactionRate v "Reaction Rate";
  // Connections to Substrates and Products

  GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S[NS]
    "connection to substrates";
  GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P[NP] "connection to product";
equation

  for i in 1:NS loop
    rc_S[i].r = n_S[i] * v;
  end for;
  for i in 1:NP loop
    rc_P[i].r = -n_P[i] * v;
  end for;

end BasicReaction;
