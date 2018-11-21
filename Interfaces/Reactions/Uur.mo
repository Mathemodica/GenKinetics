within GenKinetics.Interfaces.Reactions;
partial model Uur "Interface for S <=> P"
  import GenKinetics;
  extends Uu;
  extends GenKinetics.Interfaces.Reactions.Reversible.TwoWays;
end Uur;
