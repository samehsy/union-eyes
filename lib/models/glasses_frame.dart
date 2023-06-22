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
  final int? price;
  final String? frameType;
  final int? size;
  final int? arm;
  final int? bridge;
  final FrameShape? frameshape;
  final FrameClass? frameClass;
  final String? manufactureCompany;
  final List<dynamic>? imageUrl;
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

    factory GlassesFrame.fromJson(Map<String, dynamic> json) {
    return GlassesFrame(
      id: json['id'],
      price: json['price'],
      imageUrl: json['images'],
      noModel: json['numberModel'],
    );
  }
}
