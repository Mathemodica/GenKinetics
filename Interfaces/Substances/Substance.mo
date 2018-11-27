within GenKinetics.Interfaces.Substances;
partial model Substance "Basic declaration of a Substance"
  parameter Units.Concentration c_0 = 0 "initial concentration";
  Units.Concentration c(start = c_0) "substance concentration";
  Units.VolumetricReactionRate r_net "net reaction rate";
                                                          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Substance;
