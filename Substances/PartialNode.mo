within GenKinetics.Substances;
partial model PartialNode "Basic declaration of a Node"
  parameter Units.Concentration c_0 = 0 "initial concentration";
  Units.Concentration c(start = c_0) "substance concentration";
  Units.VolumetricReactionRate r_net "net reaction rate";
                                                          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialNode;
