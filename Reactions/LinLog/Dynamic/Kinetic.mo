within GenKinetics.Reactions.LinLog.Dynamic;
model Kinetic "Implementation of Linlog kinetic without modification"
  extends ReactionTerm;
equation
  v = v_steady +R;
end Kinetic;
