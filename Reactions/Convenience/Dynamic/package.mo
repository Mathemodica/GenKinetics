within GenKinetics.Reactions.Convenience;
package Dynamic
  extends Modelica.Icons.Package;





  partial model BasicReaction "basic declaration of a reaction "
    extends Interfaces.Dynamic.Dimension.ReactionDimension;
    Units.VolumetricReactionRate v "Reaction Rate";
    // Connections to Substrates and Products
    GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S[NS] "connection to substrates";
    GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P[NP] "connection to product";
  equation
    rc_S[:].r = n_S[:] * v;
    rc_P[:].r = -n_P[:] * v;
  end BasicReaction;

  partial model ReactionActivation "Interface for activating a reaction"
    parameter Integer NA = 1 "number of Metabolites activating the reaction";
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A[NA] "connectors to the activating node";
    parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";

protected
    Real A "activation term";

  equation

    A = product({(KA .+ mc_A.c) ./ KA  for i in 1:NA});

  end ReactionActivation;






  partial model ReactionInhibition "Interface for inhibiting a reaction"
    parameter Integer NI = 1 "number of Metabolites inhibiting the reaction";
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I[NI] "connection to inhibitors";
    parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";

protected
    Real I "inhibition term in the corresponding kinetics";

  equation

    I = product({KI ./ (KI .+ mc_I.c) for i in 1:NI});

  end ReactionInhibition;




  partial model BasicIrrReaction "basic declaration of an irreversible reaction "
    extends Reactions.Convenience.Dynamic.BasicReaction;
    extends Interfaces.Reversible.OneWay;

    parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";

protected
    Real S1 "Kinetic terms";
    Real S2;

  equation

    // S1 = Vfwdmax * product({rc_S[i].c / KmS[i] for i in 1:NS});

    // S2 = product({rc_S[i].c / KmS[i] + 1 for i in 1:NS});

    S1 = Vfwdmax * product(rc_S.c ./ KmS);

    S2 = product(rc_S.c ./ KmS .+ 1);
  end BasicIrrReaction;
















  partial model BasicRevReaction "basic declaration of a reversible reaction "
    extends Reactions.Convenience.Dynamic.BasicIrrReaction;
    extends Interfaces.Reversible.TwoWay;

    parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";

protected
    Real P1;
    Real P2;

  equation

    P1 = Vbwdmax * product({rc_P.c ./ KmP for i in 1:NP});
    P2 = product({rc_P.c ./ KmP .+ 1 for i in 1:NP});

  end BasicRevReaction;





  model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
  equation
    v = S1 / S2;
  end IrrKinetic;




  annotation (
    Documentation(info = "<html><head></head><body><h2><font size=\"3\">Reactions with parameterized number of connections suitable for model generation and textual implementation</font></h2><p style=\"font-size: 12px;\"><strong><u>Information</u></strong></p><div class=\"textDoc\"><p style=\"font-family: 'Courier New'; font-size: 12px;\"></p></div><div class=\"htmlDoc\"><p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));
end Dynamic;
