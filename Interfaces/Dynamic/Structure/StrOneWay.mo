within GenKinetics.Interfaces.Dynamic.Structure;
partial model StrOneWay "Structure Uni Uni "
  extends ReactionStructure(redeclare final model Reversibility =
        Reactions.Reversible.OneWay);
end StrOneWay;
