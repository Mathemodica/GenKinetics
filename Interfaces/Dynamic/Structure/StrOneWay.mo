within GenKinetics.Interfaces.Dynamic.Structure;
partial model StrOneWay "Structure Uni Uni "
  extends ReactionStructure(redeclare final model Reversibility =
        Reversible.OneWay);
end StrOneWay;
