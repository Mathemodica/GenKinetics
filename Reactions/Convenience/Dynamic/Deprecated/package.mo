within GenKinetics.Reactions.Convenience.Dynamic;

package Deprecated
  partial model BasicActivator "Interface for activating a reaction"
    extends Interfaces.Dynamic.ActivationConnections;
    extends ModifiersTerm;
    parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
  protected
    Real A "activation term";
  equation
    A = product((KA .+ mc_A.c) ./ KA);
  end BasicActivator;

  partial model BasicInhibitor "Interface for inhibiting a reaction"
    extends ModifiersTerm;
    parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";
  protected
    Real I "inhibition term in the corresponding kinetics";
    Real Ic[NI];
  equation
    Ic = mc_I.c;
    I = product(KI ./ (KI .+ Ic));
  end BasicInhibitor;

  partial model BasicModifier
    extends Interfaces.Dynamic.ModifiersConnections;
  end BasicModifier;

  partial model BasicActivatorAndInhibitor
    extends BasicActivator;
    extends BasicInhibitor;
  end BasicActivatorAndInhibitor;

end Deprecated;
