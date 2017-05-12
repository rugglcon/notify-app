public class MyApp : Gtk.Application {
	public MyApp() {
		Object (application_id: "com.github.rugglcon.notify-app",
		flags: ApplicationFlags.FLAGS_NONE);
	}
	
	protected override void activate() {
		var app_window = new Gtk.ApplicationWindow (this);
		var grid = new Gtk.Grid();
		grid.orientation = Gtk.Orientation.VERTICAL;
		grid.row_spacing = 6;

		var title_label = new Gtk.Label (_("Notifications"));
		var show_button = new Gtk.Button.with_label (_("Show"));

		grid.add (title_label);
		grid.add (show_button);

		show_button.clicked.connect(() => {
			var notification = new Notification (_("Hello World"));
			notification.set_body (_("This is my first notification"));
			this.send_notification ("notify.app", notification);
		});

		app_window.add (grid);
		app_window.show_all();
	}

	public static int main(string[] args) {
		var app = new MyApp();
		return app.run (args);
	}
}
