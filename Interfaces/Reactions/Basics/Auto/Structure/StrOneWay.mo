within GenKinetics.Interfaces.Reactions.Basics.Auto.Structure;
partial model StrOneWay "Structure Uni Uni "
  import GenKinetics;
  extends ReactionStructure(redeclare final model Reversibility =
        GenKinetics.Interfaces.Reactions.Reversible.OneWay);
end StrOneWay;
