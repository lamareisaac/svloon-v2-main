import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';
import 'package:svloon2/features/explorer/presentation/cubit/artistes/artistes_cubit.dart';
import 'package:svloon2/features/explorer/presentation/cubit/artistes/select_random_artist/select_artist_cubit.dart';

class SelectableAvatar extends StatefulWidget {
  SelectableAvatar({Key? key, this.artist, this.randAvatar, this.artists})
      : super(key: key);
  final Staff? artist;
  bool? randAvatar = false;
  final List<Staff>? artists;

  @override
  State<SelectableAvatar> createState() => _SelectableAvatarState();
}

class _SelectableAvatarState extends State<SelectableAvatar> {
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        child: Builder(builder: (context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;
          return GestureDetector(
            onTap: () {
              if (hasFocus) {
                focusNode.unfocus();
              } else {
                !widget.randAvatar!
                    ? 
                    BlocProvider.of<SelectArtistCubit>(context)
                        .selectArtist(widget.artist!.artistId)
                        
                    : BlocProvider.of<SelectArtistCubit>(context)
                        .selectRandomArtist(widget.artists!);

                focusNode.requestFocus();
              }
            },
            child: Column(
              children: [
                !widget.randAvatar!
                    ? _renderAvatar(hasFocus)
                    : _randAvatar(hasFocus),
                !widget.randAvatar!
                    ? Text(widget.artist?.fullname ?? "")
                    : Text("Aléatoire")
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _renderAvatar(bool hasFocus) {
    final uri = widget.artist?.imageUrl != null
        ? Uri.tryParse(widget.artist!.imageUrl)
        : null;
    final useDefault = uri == null;

    ImageProvider getProvider() {
      if (useDefault) {
        return const AssetImage('');
      }
      return NetworkImage(
        widget.artist!.imageUrl,
      );
    }

    // Render base on hasFocus state
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: hasFocus ? 5 : 3,
          color: hasFocus ? Color.fromRGBO(6, 193, 103, 1) : Colors.black,
        ),
      ),
      child: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundImage: getProvider(),
      ),
    );
  }

  Widget _randAvatar(bool hasFocus) {
    // Render base on hasFocus state
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: hasFocus ? 5 : 3,
          color: hasFocus ? Color.fromRGBO(6, 193, 103, 1) : Colors.black,
        ),
      ),
      child: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundImage: NetworkImage(
            "https://cdn-icons-png.flaticon.com/128/1160/1160231.png"),
      ),
    );
  }
}
