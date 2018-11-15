within GenKinetics.Examples;
model Spirallus
  "An abstraction of the TCA cycle with dynamic arbitrary number of connections"
  extends Modelica.Icons.Example;
  import GenKinetics.Substances.Auto.*;
  import GenKinetics.Reactions.Convenience.Auto.*;
  Substances.Auto.Substance Aex(c_0=1);
  Reactions.Convenience.Auto.InhIrrKinetic vupt(
    NS=1,
    NP=1,
    NI=1,
    Vfwdmax=1.0,
    KmS={0.1},
    KI={3.0});
  Substances.Auto.Substance A;
  Reactions.Convenience.Auto.RevKinetic v1(
    NS=1,
    NP=1,
    Vfwdmax=3.0,
    Vbwdmax=1.0,
    KmS={0.1},
    KmP={3.0});
  Substances.Auto.Substance B;
  Reactions.Convenience.Auto.RevKinetic v5(
    NS=1,
    NP=1,
    Vfwdmax=2.0,
    Vbwdmax=0.5,
    KmS={1.0},
    KmP={1.0});
  Substances.Auto.Substance E;
  Reactions.Convenience.Auto.IrrKinetic v2(
    NS=2,
    NP=1,
    Vfwdmax=2.5,
    KmS={0.25,2.0});
  // B,E -v2-> C
  Substances.Auto.Substance C;
  Reactions.Convenience.Auto.InhIrrKinetic v3(
    NS=1,
    NP=2,
    NI=1,
    Vfwdmax=2.0,
    KmS={2.0},
    KI={0.05});
  Substances.Auto.Substance D;
  Substances.Auto.Substance F;
  Reactions.Convenience.Auto.InhIrrKinetic v4(
    NS=1,
    NP=2,
    NI=1,
    Vfwdmax=3.0,
    KmS={0.1},
    KI={1.0});
  Reactions.Convenience.Auto.IrrKinetic v6(
    NS=1,
    NP=1,
    Vfwdmax=2.0,
    KmS={3.0});
  Substances.Auto.Substance Eex;
  Reactions.Convenience.Auto.IrrKinetic v7(
    NS=1,
    NP=1,
    Vfwdmax=2.0,
    KmS={3.0});
  Substances.Auto.Substance Fex;
equation
  // vupt
  connect(Aex.rc, vupt.rc_S[1]);
  connect(vupt.rc_P[1], A.rc);
  connect(vupt.mc_I[1], A.mc);
  // v1
  connect(A.rc, v1.rc_S[1]);
  connect(v1.rc_P[1], B.rc);
  // v5
  connect(B.rc, v5.rc_S[1]);
  connect(v5.rc_P[1], E.rc);
  // v2
  connect(B.rc, v2.rc_S[1]);
  connect(E.rc, v2.rc_S[2]);
  connect(v2.rc_P[1], C.rc);
  // v3
  connect(C.rc, v3.rc_S[1]);
  connect(v3.rc_P[1], D.rc);
  connect(v3.rc_P[2], F.rc);
  connect(D.mc, v3.mc_I[1]);
  // v4
  connect(D.rc, v4.rc_S[1]);
  connect(v4.rc_P[1], F.rc);
  connect(v4.rc_P[2], E.rc);
  connect(v4.mc_I[1], C.mc);
  // v6
  connect(E.rc, v6.rc_S[1]);
  connect(v6.rc_P[1], Eex.rc);
  // v7
  connect(F.rc, v7.rc_S[1]);
  connect(v7.rc_P[1], Fex.rc);
  annotation (
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", maxIntegrationOrder = "4", s = "dassl"));
end Spirallus;
