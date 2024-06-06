class NetworkEndPoints {
  static String baseUrl = 'https://api.todoist.com/rest/v2';
  static String projects = '$baseUrl/projects';
  static String singleProject = '$baseUrl/projects/{projectId}';
  static String sections = '$baseUrl/sections?project_id={projectId}';
  static String activeTasks = '$baseUrl/tasks';
}
