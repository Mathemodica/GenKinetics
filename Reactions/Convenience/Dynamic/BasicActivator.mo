within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicActivator "Interface for activating a reaction"
  extends BasicModifier;

  GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A[NA]
    "connectors to the activating node";
  parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
protected
  Real A "activation term";
equation

  A = product((KA .+ mc_A.c) ./ KA);

end BasicActivator;
