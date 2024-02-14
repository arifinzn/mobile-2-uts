import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kel7/bloc/post_bloc.dart';
import 'package:kel7/helpers/theme/app_theme.dart';
import 'package:kel7/helpers/utils/app_routes.dart';
import 'package:kel7/helpers/utils/generator.dart';
import 'package:kel7/helpers/utils/locator.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:kel7/helpers/widgets/loading_dialog.dart';
import 'package:kel7/helpers/widgets/my_spacing.dart';
import 'package:kel7/helpers/widgets/my_text.dart';
import 'package:kel7/helpers/widgets/my_text_style.dart';
import 'package:kel7/helpers/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kel7/models/loading.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late PostBloc _postBloc;
  final _navService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _postBloc = context.read<PostBloc>();
  }

  XFile? _image;
  // late _imageFile;
  final TextEditingController discriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // _postBloc.close();
    super.dispose();
    discriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(listener: (_, state) {
      if (state is PostLoading) {
        Loading loading =
            Loading(LoadingStatus.loading, 'Menambahkan Postingan', '');
        LoadingDialog.show(context, loading);
      } else if (state is PostSuccess) {
        Loading loading =
            Loading(LoadingStatus.success, 'Posting Berhasil', '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.home),
        );
      } else if (state is PostFailure) {
        Loading loading = Loading(LoadingStatus.failed, state.error, '');
        LoadingDialog.show(
          context,
          loading,
          onDone: () => _navService.pushTo(AppRoutes.home),
        );
      }
    }, builder: (_, state) {
      return _image == null
          ? Center(
              child: IconButton(
                icon: const Icon(
                  Icons.add_to_photos,
                  size: 50,
                ),
                onPressed: () => _selectImage(context),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                // backgroundColor: mobileBackgroundColor,
                leading: IconButton(
                    onPressed: () => clearImage(),
                    icon: const Icon(Icons.arrow_back)),
                title: const Text('post to'),
                actions: [
                  TextButton(
                      onPressed: () =>
                          postImage(discriptionController.text, _image!),
                      child: const Text(
                        "Kirim",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
              body: Column(
                children: [
                  isLoading
                      ? const LinearProgressIndicator()
                      : const Padding(padding: EdgeInsets.only(top: 0)),
                  const Divider(),
                  Container(
                    margin: MySpacing.fromLTRB(24, 16, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 65,
                            child: TextFormField(
                              controller: discriptionController,
                              style: MyTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500,
                                  fontSize: 12),
                              maxLines: 3,
                              decoration: InputDecoration(
                                  fillColor: customTheme.card,
                                  hintStyle: MyTextStyle.bodySmall(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500,
                                      muted: true,
                                      letterSpacing: 0,
                                      fontSize: 12),
                                  filled: true,
                                  hintText: "Keterangan",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  isDense: true,
                                  contentPadding: MySpacing.all(12)),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: MySpacing.left(16),
                        //   child: SizedBox(
                        //     height: 65,
                        //     width: 65,
                        //     child: AspectRatio(
                        //       aspectRatio: 457 / 451,
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //           image: Image.file(_image!).image,
                        //           fit: BoxFit.fill,
                        //           alignment: FractionalOffset.topCenter,
                        //         )),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ));
    });
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Buat Postingan"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  XFile file = await pickImage(ImageSource.camera);
                  setState(() {
                    _image = file;
                  });
                },
                child: const Text("Ambil Foto Kamera"),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  XFile file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _image = file;
                  });
                },
                child: const Text("Pilih Gambar Dari Galeri"),
              ),

              //cancel
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("cancel"),
              )
            ],
          );
        });
  }

  void postImage(String desc, XFile img) async {
    _postBloc.add(AddPost(desc: desc, img: img));
    // setState(() {
    //   isLoading = true;
    // });
    // try {
    //   String res = await FireStoreMethods().uploadPost(
    //       discriptionController.text, uid, _image, username, profileImage);
    //   if (res == 'success') {
    //     setState(() {
    //       isLoading = false;
    //     });
    //     showSnackBar("posted", context);
    //     clearImage();
    //   } else {
    //     showSnackBar(res, context);
    //   }
    // } catch (err) {
    //   showSnackBar(err.toString(), context);
    // }
  }

  void clearImage() {
    discriptionController.clear();
    setState(() {
      _image = null;
    });
  }
}
