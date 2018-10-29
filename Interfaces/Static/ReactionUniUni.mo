within GenKinetics.Interfaces.Static;
partial model ReactionUniUni
  extends ReactionConnections;
  extends GenKinetics.Interfaces.Static.PartialReaction1S;
  extends GenKinetics.Interfaces.Static.PartialReaction1P;
  /* extends GenKinetics.Interfaces.Dynamic.ReactionConnections(
    redeclare final model Dimensionality =
    GenKinetics.Interfaces.Dynamic.Dimension.UniUni); */

equation

  /* connect(rc_S1,rc_S[1]);
  rc_S1.c = rc_S[1].c;
  rc_S1.r = rc_S[1].r;

  // connect(rc_P1,rc_P[1]);
  rc_P1.c = rc_P[1].c;
  rc_P1.r = rc_P[1].r; */

end ReactionUniUni;
