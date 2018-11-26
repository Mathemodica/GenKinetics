within GenKinetics.UnitTests.Internal;
package Dynamic "Small reaction systems implemented using Reactions.*.Dynamic"
  model SvP_LinLog "GenKinetics implementation of S => P"
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real P0 = 0.1 "Initial concentration of P";

    parameter Real v_steady = 1.0 "reference steady-state reaction rate";

    parameter Real alpha = 1.0 "elasticity";
    parameter Real theta = -2.5 "elasticity";

    parameter Real S_steady = 0.1;
    parameter Real P_steady = 0.1;

    Substances.Auto.ReferencedSubstance S(c_0=S0, c_steady=S_steady);
    Substances.Auto.ReferencedSubstance P(c_0=P0, c_steady=P_steady);
    Reactions.LinLog.Auto.Kinetic v(
      NS=1,
      NP=1,
      v_steady=v_steady,
      alpha={alpha},
      theta={theta},
      S0={S_steady},
      P0={P_steady});
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SvP_LinLog;

  model SAIvP "GenKinetics implementation of S + A + I => P"

    parameter Real I0 = 0.3 "fixed concentration of inhibitor";
    parameter Real kI = 0.77;

    parameter Real A0 = 0.5 " fixed concentration of activator";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;
    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Substances.Auto.AmbientSubstance A(c_0=A0);
    Substances.Auto.AmbientSubstance I(c_0=I0);
    Reactions.Convenience.Auto.ActInhIrrKinetic v(
      NS=1,
      NP=1,
      NA=1,
      NI=1,
      KmS={km},
      KA={kA},
      KI={kI},
      Vfwdmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_A[1], A.mc);
    connect(v.mc_I[1], I.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SAIvP;

  model SvP_rev "GenKinetics implementation of S <=> P"

    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Reactions.Convenience.Auto.RevKinetic v(
      NS=1,
      NP=1,
      KmS={kmS},
      KmP={kmP},
      Vfwdmax=vfwd,
      Vbwdmax=vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SvP_rev;

  model S1S2vP "GenKinetics implementation of S1 + S2 => P"

    parameter Real S10 = 1.0 "initial concentration of S";
    parameter Real S20 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real kmS1 = 1.5 "kinetic parameter";
    parameter Real kmS2 = 0.3 "kinetic parameter";

    Substances.Auto.Substance S1(c_0=S10);
    Substances.Auto.Substance S2(c_0=S20);
    Substances.Auto.Substance P(c_0=0);

    Reactions.Convenience.Auto.IrrKinetic v(
      NS=2,
      NP=1,
      KmS={kmS1,kmS2},
      Vfwdmax=vfwd);

    Modelica.Blocks.Interfaces.RealOutput S1c annotation (
      Placement(visible = true, transformation(origin = {104, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput S2c annotation (
      Placement(visible = true, transformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S1.rc, v.rc_S[1]);
    connect(S2.rc, v.rc_S[2]);
    connect(v.rc_P[1], P.rc);

    S1c = S1.c;
    S2c = S2.c;
    Pc = P.c;
    v.v = r;

    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end S1S2vP;

  model SIvP_rev "GenKinetics implementation of S + I <=> P"

    parameter Real I0 = 0.5 " fixed concentration of inhibitor";
    parameter Real kI = 0.5 "kinetic parameter";
    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

    Substances.Auto.AmbientSubstance I(c_0=I0);
    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Reactions.Convenience.Auto.InhRevKinetic v(
      NS=1,
      NP=1,
      NI=1,
      KmS={kmS},
      KmP={kmP},
      KI={kI},
      Vfwdmax=vfwd,
      Vbwdmax=vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_I[1],I.mc);

    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SIvP_rev;

  model SAvP "GenKinetics implementation of S + A => P"

    parameter Real A0 = 0.5 " fixed concentration of inhibitor";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;

    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Substances.Auto.AmbientSubstance A(c_0=A0);

    Reactions.Convenience.Auto.ActIrrKinetic v(
      NS=1,
      NP=1,
      NA=1,
      KmS={km},
      KA={kA},
      Vfwdmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_A[1], A.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SAvP;

  model SAIvP_rev "GenKinetics implementation of S + A + I => P"

    parameter Real I0 = 0.3 "fixed concentration of inhibitor";
    parameter Real kI = 0.77;

    parameter Real A0 = 0.5 " fixed concentration of activator";
    parameter Real kA = 0.5 "kinetic parameter";
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;

    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmP = 0.77 "kinetic parameter";

    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Substances.Auto.AmbientSubstance A(c_0=A0);
    Substances.Auto.AmbientSubstance I(c_0=I0);
    Reactions.Convenience.Auto.ActInhRevKinetic v(
      NS=1,
      NP=1,
      NA=1,
      NI=1,
      KmS={kmS},
      KmP={kmP},
      KA={kA},
      KI={kI},
      Vfwdmax=vfwd,
      Vbwdmax=vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_A[1], A.mc);
    connect(v.mc_I[1], I.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SAIvP_rev;

  model SvP "GenKinetics implementation of S => P"

  parameter GenKinetics.Units.AffinityConst km = 2.0;
  parameter GenKinetics.Units.Concentration S0 = 1.0;
  parameter Units.ReactionCoef vfwd = 1.0;

    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);
    Reactions.Convenience.Auto.IrrKinetic v(
      NS=1,
      NP=1,
      KmS={km},
      Vfwdmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S.rc,v.rc_S[1]);
    connect(v.rc_P[1],P.rc);

    Sc = S.c;
    Pc = P.c;
    v.v = r;

  annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SvP;

  model SIvP "GenKinetics implementation of S +  I => P"

    parameter Real I0 = 0.3 "fixed concentration of inhibitor";
    parameter Real kI = 0.77;

    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;
    Substances.Auto.Substance S(c_0=S0);
    Substances.Auto.Substance P(c_0=0);

    Substances.Auto.AmbientSubstance I(c_0=I0);
    Reactions.Convenience.Auto.InhIrrKinetic v(
      NS=1,
      NP=1,
      NI=1,
      KmS={km},
      KI={kI},
      Vfwdmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc, v.rc_S[1]);
    connect(v.rc_P[1], P.rc);
    connect(v.mc_I[1], I.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SIvP;

  package deprecated
    model SvP_rev "GenKinetics implementation of S <=> P"

      parameter Real S0 = 1.0 "initial concentration of S";
      parameter Real vfwd = 1.5 "kinetic parameter";
      parameter Real vbwd = 0.5 "kinetic parameter";
      parameter Real kmS = 2.0 "kinetic parameter";
      parameter Real kmP = 0.3 "kinetic parameter";

      Substances.Auto.Substance S(c_0=S0);
      Substances.Auto.Substance P(c_0=0);
      Reactions.Convenience.Auto.deprecated.RevKinetic v(
        NS=1,
        NP=1,
        KmS={kmS},
        KmP={kmP},
        Vfwdmax=vfwd,
        Vbwdmax=vbwd);
      Modelica.Blocks.Interfaces.RealOutput Sc annotation (
        Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Pc annotation (
        Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput r annotation (
        Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(S.rc, v.rc_S[1]);
      connect(v.rc_P[1], P.rc);
      Sc = S.c;
      Pc = P.c;
      v.v = r;
      annotation (
        Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
    end SvP_rev;
  end deprecated;
end Dynamic;
