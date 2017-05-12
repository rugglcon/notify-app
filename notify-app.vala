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
			var image = new Gtk.Image.from_icon_name ("dialog-warning", Gtk.IconSize.DIALOG);
			notification.set_icon (image.gicon);
			notification.set_body (_("This is my first notification"));
			this.send_notification ("notify.app", notification);
		});

		var replace_button = new Gtk.Button.with_label (_("Replace"));
		grid.add (replace_button);

		replace_button.clicked.connect (() => {
			var notification = new Notification (_("Hello Again"));
			notification.set_body (_("This is my second notification"));

			var image = new Gtk.Image.from_icon_name ("dialog-warning", Gtk.IconSize.DIALOG);
			notification.set_icon (image.gicon);
			this.send_notification ("com.github.rugglcon.notify-app", notification);

		});
		app_window.add (grid);
		app_window.show_all();
	}

	public static int main(string[] args) {
		var app = new MyApp();
		return app.run (args);
	}
}
