within GenKinetics.Reactions.Convenience.Dynamic;

partial model BasicModifier

  replaceable class Inhibition = Interfaces.Dynamic.Modifier.UnspecifiedInhibition constrainedby
    Interfaces.Dynamic.Modifier.ReactionInhibition;
  extends Inhibition;
  
  replaceable class Activation = Interfaces.Dynamic.Modifier.UnspecifiedActivation
constrainedby 
    Interfaces.Dyanmic.Modifier.ReactionActivation;
  extends Activation;
    
end BasicModifier;
