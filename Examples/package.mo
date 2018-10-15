within GenKinetics;

package Examples
  extends Modelica.Icons.ExamplesPackage;

  model Spirallusdyn "An abstraction of the TCA cycle with dynamic arbitrary number of connections"
    extends Modelica.Icons.Example;
    import GenKinetics.NodeElements.Dynamic.*;
    import GenKinetics.Reactions.Convenience.Dynamic.*;
    Node Aex(c_0 = 1);
    InhIrrKinetic vupt(NS = 1, NP = 1, NI = 1, Vfwdmax = 1.0, KmS = {0.1}, KI = {3.0});
    Node A;
    RevKinetic v1(NS = 1, NP = 1, Vfwdmax = 3.0, Vbwdmax = 1.0, KmS = {0.1}, KmP = {3.0});
    Node B;
    RevKinetic v5(NS = 1, NP = 1, Vfwdmax = 2.0, Vbwdmax = 0.5, KmS = {1.0}, KmP = {1.0});
    Node E;
    IrrKinetic v2(NS = 2, NP = 1, Vfwdmax = 2.5, KmS = {0.25, 2.0});
    // B,E -v2-> C
    Node C;
    InhIrrKinetic v3(NS = 1, NP = 2, NI = 1, Vfwdmax = 2.0, KmS = {2.0}, KI = {0.05});
    Node D;
    Node F;
    InhIrrKinetic v4(NS = 1, NP = 2, NI = 1, Vfwdmax = 3.0, KmS = {0.1}, KI = {1.0});
    IrrKinetic v6(NS = 1, NP = 1, Vfwdmax = 2.0, KmS = {3.0});
    Node Eex;
    IrrKinetic v7(NS = 1, NP = 1, Vfwdmax = 2.0, KmS = {3.0});
    Node Fex;
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
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", maxIntegrationOrder = "4", s = "dassl"));
  end Spirallusdyn;
end Examples;
