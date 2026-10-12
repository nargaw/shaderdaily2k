float circleSDF(vec2 coords, float radius) {
  return length(coords) - radius;
}