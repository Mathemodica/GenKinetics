within GenKinetics.Interfaces.Reactions.Basics.Auto.Structure;
partial model ReactionStructure
  "The structure of a reaction reversibility, molecularity and order"

  replaceable model Reversibility =
      Reactions.Basics.Reversible.UnspecifiedReversibility                                          constrainedby
    Reactions.Basics.Reversible.ReactionReversibility;
  extends Reversibility;

  replaceable model Dimensionality =
      Dimension.UnspecifiedDimension constrainedby Dimension.ReactionDimension;
  extends Dimensionality;

  /*replaceable class Inhibition = Interfaces.Dynamic.Modifier.UnspecifiedInhibition constrainedby
      Interfaces.Dynamic.Modifier.ReactionInhibition;
    extends Inhibition;
    
    replaceable class Activation = Interfaces.Dynamic.Modifier.UnspecifiedActivation
  constrainedby 
      Interfaces.Dyanmic.Modifier.ReactionActivation; */

end ReactionStructure;
