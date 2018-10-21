﻿within GenKinetics.Reactions.Convenience;
package Dynamic
  extends Modelica.Icons.Package;





  partial model BasicReaction "basic declaration of a reaction "

    replaceable model Structure =
      Interfaces.Dynamic.Structure.ReactionStructure                             constrainedby
    Interfaces.Dynamic.Structure.ReactionStructure;
    extends Structure;

    replaceable model Modifier = Reactions.Convenience.Dynamic.BasicModifier constrainedby
    Reactions.Convenience.Dynamic.BasicModifier;
    extends Modifier;

    Units.VolumetricReactionRate v "Reaction Rate";
    // Connections to Substrates and Products
    
    GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S[NS] "connection to substrates";
    GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P[NP] "connection to product";
  equation

    for i in 1:NS loop
      rc_S[i].r = n_S[i] * v;
    end for;
    for i in 1:NP loop
      rc_P[i].r = -n_P[i] * v;
    end for;

  end BasicReaction;











  partial model BasicIrrReaction "basic declaration of an irreversible reaction "
    extends Reactions.Convenience.Dynamic.BasicReaction;

    parameter Units.AffinityConst KmS[NS] = ones(NS) "affinity constants of the substrate nodes";

protected
    Real S1 "Kinetic terms";
    Real S2;
    Real cS[NS];
  
  equation

    cS = rc_S.c; 
    S1 = Vfwdmax * product(cS ./ KmS);
    S2 = product(cS ./ KmS .+ 1);

  end BasicIrrReaction;




























  partial model BasicRevReaction "basic declaration of a reversible reaction "
    extends Reactions.Convenience.Dynamic.BasicIrrReaction(
      redeclare final model Reversibility = Interfaces.Reversible.TwoWay);

    parameter Units.AffinityConst KmP[NP] = ones(NP) "affinity constants of the product node";

protected
    Real P1;
    Real P2;

  equation

    P1 = Vbwdmax * product(rc_P.c ./ KmP);
    P2 = product(rc_P.c ./ KmP .+ 1);

  end BasicRevReaction;









  model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
      redeclare final model Activation=Interfaces.Dynamic.Modifier.NoActivation,
      redeclare final model Inhibition=Interfaces.Dynamic.Modifier.NoInhibition);
  equation
    v = S1 / S2;
  end IrrKinetic;




















  model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
      redeclare final model Modifier=
        Reactions.Convenience.Dynamic.BasicInhibitor,
      redeclare final model Activation=Interfaces.Dynamic.Modifier.NoActivation);

  equation
    v = I * S1 / S2;
  end InhIrrKinetic;











  model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
      redeclare final model Modifier=
        Reactions.Convenience.Dynamic.BasicActivator,
      redeclare final model Inhibition=Interfaces.Dynamic.Modifier.NoInhibition);
  equation
    v = A * S1 / S2;
  end ActIrrKinetic;










  model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
      redeclare final model Modifier =
          Reactions.Convenience.Dynamic.BasicActivatorAndInhibitor);
  equation
    v = A * I * S1 / S2;
  end ActInhIrrKinetic;






  model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(
      redeclare final model Activation=Interfaces.Dynamic.Modifier.NoActivation,
      redeclare final model Inhibition=Interfaces.Dynamic.Modifier.NoInhibition);
  equation
    v = (S1 - P1) / (S2 + P2 - 1);
  end RevKinetic;



  model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(
      redeclare final model Modifier=
        Reactions.Convenience.Dynamic.BasicInhibitor,
      redeclare final model Activation=Interfaces.Dynamic.Modifier.NoActivation);
  equation
    v = I * (S1 - P1) / (S2 + P2 - 1);
  end InhRevKinetic;





  model ActRevKinetic "S1 + S2 + ...  <==A1,A2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(
      redeclare final model Modifier=
        Reactions.Convenience.Dynamic.BasicActivator,
      redeclare final model Inhibition=Interfaces.Dynamic.Modifier.NoInhibition);
  equation
    v = A * (S1 - P1) / (S2 + P2 - 1);
  end ActRevKinetic;





  model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(
      redeclare final model Modifier =
          Reactions.Convenience.Dynamic.BasicActivatorAndInhibitor);
  equation
    v = A * I * (S1 - P1) / (S2 + P2 - 1);
  end ActInhRevKinetic;



  partial model BasicActivator "Interface for activating a reaction"
    extends BasicModifier;

    GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A[NA] "connectors to the activating node";
    parameter Units.AffinityConst KA[NA] = ones(NA) "activation constants";
protected
    Real A "activation term";
  equation

    A = product((KA .+ mc_A.c) ./ KA);

  end BasicActivator;




















  partial model BasicInhibitor "Interface for inhibiting a reaction"
    extends BasicModifier;
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I[NI] "connection to inhibitors";
    parameter Units.AffinityConst KI[NI] = ones(NI) "affinity constant of the Inhibitors";

protected
    Real I "inhibition term in the corresponding kinetics";

  equation

    I = product(KI ./ (KI .+ mc_I.c));

  end BasicInhibitor;








  annotation (
    Documentation(info = "<html><head></head><body><h2><font size=\"3\">Reactions with parameterized number of connections suitable for model generation and textual implementation</font></h2><p style=\"font-size: 12px;\"><strong><u>Information</u></strong></p><div class=\"textDoc\"><p style=\"font-family: 'Courier New'; font-size: 12px;\"></p></div><div class=\"htmlDoc\"><p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));
end Dynamic;
