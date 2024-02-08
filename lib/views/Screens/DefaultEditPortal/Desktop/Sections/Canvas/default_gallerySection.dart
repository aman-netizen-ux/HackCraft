import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class DefaultEditGallerySection extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditGallerySection(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    // Retrieve the GalleryProvider instance from the nearest ancestor
    // in the widget tree, using the Provider package.
    final galleryProvider = Provider.of<GalleryProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: defaultEditScaleWidth(containerWidth, 81),
        right: defaultEditScaleWidth(containerWidth, 81),
        top: defaultEditScaleHeight(containerHeight, 160),
        bottom: defaultEditScaleHeight(containerHeight, 180),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Heading of the Gallery section.
          Text('Gallery',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: defaultEditScaleWidth(containerWidth, 48),
                  fontWeight: FontWeight.w600,
                  height: lineHeight(23, 48),
                  color: black1)),

          SizedBox(height: defaultEditScaleHeight(containerHeight, 94)),

          //From here, the images will be shown in the list view using the list made in the gallery provider.
          Stack(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: galleryProvider.galleryImages.isEmpty
                      ? [
                          Container(
                              height: defaultEditScaleHeight(containerHeight, 379),
                              width: defaultEditScaleWidth(containerWidth, 689),
                              clipBehavior: Clip.hardEdge,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                border: Border.all(color: black1.withOpacity(0.5)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      color: black1.withOpacity(0.5),
                                      offset: const Offset(0, 5),
                                      spreadRadius: 0)
                                ],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ImageSettings(
                                containerHeight: containerHeight,
                                containerWidth: containerWidth,
                                width: defaultEditScaleWidth(containerWidth, 689),
                                index: -1,
                              ))
                        ]
                      : List.generate(galleryProvider.galleryImages.length,
                          (index) {
                          //length of the image list present in the provider
                          int imagesLength =
                              galleryProvider.galleryImages.length;
                          //These cardWidth and cardHeight variables are created in order
                          //to set the height and width of every image that will be shown.
                          double cardWidth;
                          double cardHeight;

                          //This code written below this comment is used to make images of different heights and widths based on the number of images present in the list.
                          //We have restricted the maximum images to 5.
                          //That's why the logic is not that dynamic.
                          //It'll work only for 5 or less images.

                          if (imagesLength % 2 == 0) {
                            //If the number of images is even, then we have two cases: either 2 images will be there
                            //or 4 images will be there because we have restricted the maximum images to 5.

                            //When two images are there,  it'll set the same width and height for both images.
                            if (imagesLength == 2) {
                              cardWidth =
                                  defaultEditScaleWidth(containerWidth, 545);
                              cardHeight =
                                  defaultEditScaleHeight(containerHeight, 299);
                            } else {
                              //Otherwise, only 1 case remains, in which 4 images are present.

                              //For that, we have to set the size of the first and last images to be the same
                              //and the second and third images to be the same.

                              //It's checking if the index in the list view is first or last, then setting this height and width to the image.
                              if (index == 0 || index == imagesLength - 1) {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 285);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 236);
                              } else {
                                //If the index is second or third, then setting this height and width to the image
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 247);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 299);
                              }
                            }
                          } else {
                            //If the number of images is odd,then we have three cases: either one image will be there,
                            //three images will be there, or five images will be there.

                            //When only one image is there, we'll set this height and width of the image.
                            if (imagesLength == 1) {
                              cardWidth =
                                  defaultEditScaleWidth(containerWidth, 689);
                              cardHeight =
                                  defaultEditScaleHeight(containerHeight, 379);
                            }
                            //Otherwise, we'll check whether the number of images is 3 or 5
                            //And then apply the logic according to their length.
                            else if (imagesLength == 3) {
                              //If the number of images is 3, then we'll set the height and width of the first image to be the same
                              //and the height and width of the middle or second image to be greater than the other two images.
                              if (index == 0 || index == imagesLength - 1) {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 300);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 299);
                              } else {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 438);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 379);
                              }
                            }
                            //This is the last case in which the number of images is 5.
                            //In this, the size of the middle image will be larger than the other four images,
                            //and the size of the images adjacent to the middle image will be smaller than the middle image
                            //but greater than their adjacent images, i.e., images present at the first and last positions.
                            else {
                              //Check if the index of the image is first or last; if yes, then set this size.
                              if (index == 0 || index == imagesLength - 1) {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 192);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 236);
                              }
                              //Check if the index is second from the start or second from the last.
                              else if (index == 1 ||
                                  index == imagesLength - 2) {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 188);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 299);
                              }
                              //if the index is in the middle of the image list
                              else {
                                cardWidth =
                                    defaultEditScaleWidth(containerWidth, 267);
                                cardHeight = defaultEditScaleHeight(
                                    containerHeight, 379);
                              }
                            }
                          }
                          return GalleryImageWindow(
                            height: cardHeight,
                            width: cardWidth,
                            index: index,
                            containerHeight: containerHeight,
                            containerWidth: containerWidth,
                          );
                        })),
            ],
          ),
        ],
      ),
    );
  }
}

class GalleryImageWindow extends StatefulWidget {
  const GalleryImageWindow({
    super.key,
    required this.height,
    required this.width,
    required this.index,
    required this.containerHeight,
    required this.containerWidth,
  });

  final double height;
  final double width;
  final int index;
  final double containerHeight;
  final double containerWidth;

  @override
  State<GalleryImageWindow> createState() => _GalleryImageWindowState();
}

class _GalleryImageWindowState extends State<GalleryImageWindow> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final galleryProvider = Provider.of<GalleryProvider>(context);
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: Container(
          height: widget.height,
          width: widget.width,
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isHover ? Colors.white : null,
            border:
                !isHover ? Border.all(color: black1.withOpacity(0.5)) : null,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: isHover
                      ? Colors.black.withOpacity(0.4)
                      : black1.withOpacity(0.5),
                  offset: const Offset(0, 5),
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child:  Stack(
                  children: [
                    galleryProvider.galleryImages[widget.index] == 'default'
                        ? Image.asset(
                            'assets/images/defaultTemplate/GalleryImage.png',
                            fit: BoxFit.cover,
                            height: widget.height,
                            width: widget.width,
                          )
                        : Image.memory(
                            base64Decode(
                                galleryProvider.galleryImages[widget.index]),
                            fit: BoxFit.cover,
                            height: widget.height,
                            width: widget.width,
                          ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Visibility(
                      visible: !isHover? false: true,
                          child: ImageSettings(
                            containerHeight: widget.containerHeight,
                            containerWidth: widget.containerWidth,
                            index: widget.index,
                            width: widget.width,
                          ),
                        ))
                  ],
                )),
    );
  }
}

class ImageSettings extends StatelessWidget {
  const ImageSettings({
    super.key,
    required this.width,
    required this.index,
    required this.containerHeight,
    required this.containerWidth,
  });
  final double width;
  final int index;
  final double containerHeight;
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    final galleryProvider = Provider.of<GalleryProvider>(context);
    return Container(
      width: width,
      // margin: EdgeInsets.symmetric(
      //   horizontal: defaultEditScaleWidth(widget.containerWidth, 5),
      //   vertical: defaultEditScaleHeight(widget.containerHeight, 2)
      // ),
      padding: EdgeInsets.symmetric(
          horizontal: defaultEditScaleWidth(containerWidth, 16),
          vertical: defaultEditScaleHeight(containerHeight, 8)),
      decoration: const BoxDecoration(
        color: black1,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          index>-1?InkWell(
              onTap: () {
                galleryProvider.deletePic(index);
              },
              child: const Icon(Icons.delete, color: Colors.white)):const SizedBox(),
          InkWell(
              onTap: () {
                if(galleryProvider.galleryImages.length<5){
                   galleryProvider.pickImage();
                }
               
              },
              child:  Icon(Icons.add,
               color: galleryProvider.galleryImages.length==5
              ?Colors.white.withOpacity(0.5)
              : Colors.white
               )),
          index>-1?InkWell(
              onTap: () {
                galleryProvider.replaceImage(index);
              },
              child: const Icon(Icons.repeat, color: Colors.white)): const SizedBox()
        ],
      ),
    );
  }
}
