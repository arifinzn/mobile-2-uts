class Loading {
  final LoadingStatus status;
  final String title;
  final String subtitle;

  Loading(this.status, this.title, this.subtitle);
}

enum LoadingStatus { loading, success, failed }
