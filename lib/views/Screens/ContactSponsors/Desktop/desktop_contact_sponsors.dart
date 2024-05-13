// import 'package:flutter/material.dart';
// import 'package:major_project__widget_testing/state/galleryProvider.dart';
// import 'package:provider/provider.dart';

// class ContactSponsorsDesktopBody extends StatefulWidget {
//   const ContactSponsorsDesktopBody({super.key});

//   @override
//   State<ContactSponsorsDesktopBody> createState() =>
//       _ContactSponsorsDesktopBodyState();
// }

// class _ContactSponsorsDesktopBodyState
//     extends State<ContactSponsorsDesktopBody> {
//   @override
//   Widget build(BuildContext context) {
//         final galleryProvider = Provider.of<GalleryProvider>(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//             onTap: () => Navigator.pop(context),
//             child: const Icon(Icons.arrow_back)),


//         //     Column(
//         //       children: List.generate(galleryProvider.galleryImagesURL.length, (index) {
//         //         return Column(
//         //           children: [
//         //             Image.network(
//         //   galleryProvider.galleryImagesURL[index],
//         //   fit: BoxFit.cover,
//         //   height: 200,
//         //   width: 400,
//         // ),

//         // Text(galleryProvider.galleryImagesURL[index])
//         //           ],
//         //         );
//         //       }),
//         //     )

        
//         const Center(
//           child: Text(
//             'Contact Sponsors',
//             style: TextStyle(
//               fontSize: 24
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // replace the text with widgets, divide in different files under sections if needed



import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:provider/provider.dart';

class ContactSponsorsDesktopBody extends StatefulWidget {
  const ContactSponsorsDesktopBody({super.key});

  @override
  State<ContactSponsorsDesktopBody> createState() =>
      _ContactSponsorsDesktopBodyState();
}

class _ContactSponsorsDesktopBodyState
    extends State<ContactSponsorsDesktopBody> {
  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            NodeContainer(label: 'Root Node'),
            Expanded(
              child: Row(
                children: [
                  NodePath(label: 'Path 1', child: NodeContainer(label: 'Child 1')),
                  NodePath(label: 'Path 2', child: NodeContainer(label: 'Child 2')),
                  // ... Add more paths as needed
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}

class NodeContainer extends StatelessWidget {
  final String label;

  NodeContainer({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class NodePath extends StatelessWidget {
  final String label;
  final Widget child;

  NodePath({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(label),
            Expanded(child: Container()), // This represents the path
            child,
          ],
        ),
      ),
    );
  }
}


// replace the text with widgets, divide in different files under sections if needed