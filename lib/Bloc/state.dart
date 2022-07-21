abstract class AppStates {}

class InitialState extends AppStates {}

class GetAllTracksSuccessState extends AppStates {}
class GetAllTracksErrorState extends AppStates {}

class GetTrackDetailsSuccessState extends AppStates {}
class GetTrackDetailsErrorState extends AppStates {}

class GetTrackLyricsSuccessState extends AppStates {}
class GetAllTrackLyricsErrorState extends AppStates {}