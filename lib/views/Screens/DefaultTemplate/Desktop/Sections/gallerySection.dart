import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the GalleryProvider instance from the nearest ancestor
    // in the widget tree, using the Provider package.
    final galleryProvider = Provider.of<GalleryProvider>(context);
    return Padding(
      key: gallery,
      padding: EdgeInsets.only(
        left: scaleWidth(context, 81),
        right: scaleWidth(context, 81),
        top: scaleHeight(context, 160),
        bottom: scaleHeight(context, 180),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Heading of the Gallery section.
          Text('Gallery',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleWidth(context, 48),
                  fontWeight: FontWeight.w600,
                  height: lineHeight(23, 48),
                  color: black1)),

          SizedBox(height: scaleHeight(context, 94)),

          //From here, the images will be shown in the list view using the list made in the gallery provider.
          SizedBox(
            height: scaleHeight(context, 379),
            child: ListView.builder(
              //The list view isn't scrollable, but the axis it'll be on is horizontal.
              scrollDirection: Axis.horizontal,
              itemCount: galleryProvider.galleryImages.length,
              itemBuilder: (context, index) {
                //length of the image list present in the provider
                int imagesLength = galleryProvider.galleryImages.length;
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
                    cardWidth = scaleWidth(context, 545);
                    cardHeight = scaleHeight(context, 299);
                  } else {
                    //Otherwise, only 1 case remains, in which 4 images are present.

                    //For that, we have to set the size of the first and last images to be the same 
                    //and the second and third images to be the same.

                    //It's checking if the index in the list view is first or last, then setting this height and width to the image.
                    if (index == 0 || index == imagesLength - 1) {
                      cardWidth = scaleWidth(context, 285);
                      cardHeight = scaleHeight(context, 236);
                    } else {
                      //If the index is second or third, then setting this height and width to the image
                      cardWidth = scaleWidth(context, 247);
                      cardHeight = scaleHeight(context, 299);
                    }
                  }
                } else {
                  //If the number of images is odd,then we have three cases: either one image will be there, 
                  //three images will be there, or five images will be there.

                  //When only one image is there, we'll set this height and width of the image.
                  if (imagesLength == 1) {
                    cardWidth = scaleWidth(context, 689);
                    cardHeight = scaleHeight(context, 379);
                  } 
                  //Otherwise, we'll check whether the number of images is 3 or 5 
                  //And then apply the logic according to their length.
                  else if (imagesLength == 3) {
                    //If the number of images is 3, then we'll set the height and width of the first image to be the same 
                    //and the height and width of the middle or second image to be greater than the other two images.
                    if (index == 0 || index == imagesLength - 1) {
                      cardWidth = scaleWidth(context, 300);
                      cardHeight = scaleHeight(context, 299);
                    } else {
                      cardWidth = scaleWidth(context, 438);
                      cardHeight = scaleHeight(context, 379);
                    }
                  }
                  //This is the last case in which the number of images is 5.
                  //In this, the size of the middle image will be larger than the other four images, 
                  //and the size of the images adjacent to the middle image will be smaller than the middle image 
                  //but greater than their adjacent images, i.e., images present at the first and last positions.
                  else {
                    //Check if the index of the image is first or last; if yes, then set this size.
                    if (index == 0 || index == imagesLength - 1) {
                      cardWidth = scaleWidth(context, 192);
                      cardHeight = scaleHeight(context, 236);
                    }
                    //Check if the index is second from the start or second from the last.
                    else if (index == 1 || index == imagesLength - 2) {
                      cardWidth = scaleWidth(context, 188);
                      cardHeight = scaleHeight(context, 299);
                    } 
                    //if the index is in the middle of the image list
                    else {
                      cardWidth = scaleWidth(context, 267);
                      cardHeight = scaleHeight(context, 379);
                    }
                  }
                }

                return 
                    // Container(
                    //   // width: cardWidth,
                    //   // height : cardHeight,
                    //   margin: EdgeInsets.all(8.0),
                    //   decoration: BoxDecoration(

                    //     image: DecorationImage(image: AssetImage(galleryProvider.galleryImages[index]), fit: BoxFit.cover, scale : cardWidth/cardHeight),
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //child:
                    Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children:[ Image.asset(
                      galleryProvider.galleryImages[index],
                      fit: BoxFit.cover,
                      height: cardHeight,
                      width: cardWidth,
                    ),
                    ]
                  ),
                );
                //);
              },
            ),
          ),
        ],
      ),
    );
  }
}
