enum FrameClass {
  Woman,
  Man,
  Child,
}
enum FrameShape {
  Oval,
  Square,
  Rectangular,
  Circular,
}

class GlassesFrame {
  final int? id;
  final String? noModel;
  final String? noColor;
  final double? price;
  final String? frameType;
  final int? size;
  final int? arm;
  final int? bridge;
  final FrameShape? frameshape;
  final FrameClass? frameClass;
  final String? manufactureCompany;
  final List<String>? imageUrl;
  final String? companyIcon;

  GlassesFrame({
    this.id,
    this.noModel,
    this.noColor,
    this.price,
    this.frameType,
    this.size,
    this.arm,
    this.bridge,
    this.frameshape,
    this.frameClass,
    this.manufactureCompany,
    this.imageUrl,
    this.companyIcon,
  });
}
