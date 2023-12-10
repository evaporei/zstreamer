const std = @import("std");
const gst = @cImport({
    @cInclude("gst/gst.h");
});
const glib = @cImport({
    @cInclude("glib.h");
});

pub fn main() void {
    gst.gst_init(@ptrCast(&std.os.argv.len), @ptrCast(&std.os.argv.ptr));

    const pipeline: *gst.GstElement = gst.gst_parse_launch(
        "playbin uri=https://www.freedesktop.org/software/gstreamer-sdk/data/media/sintel_trailer-480p.webm",
        null,
    );
    const bus: *gst.GstBus = gst.gst_element_get_bus(pipeline);
    _ = gst.gst_element_set_state(pipeline, gst.GST_STATE_PLAYING);
    const msg: *gst.GstMessage = gst.gst_bus_timed_pop_filtered(
        bus,
        gst.GST_CLOCK_TIME_NONE,
        gst.GST_MESSAGE_ERROR | gst.GST_MESSAGE_EOS,
    );

    if (gst.GST_MESSAGE_TYPE(msg) == gst.GST_MESSAGE_ERROR) {
        std.debug.print("an error ocurred bla bla bla\n", .{});
    }

    gst.gst_object_unref(bus);
    _ = gst.gst_element_set_state(pipeline, gst.GST_STATE_NULL);
    gst.gst_object_unref(pipeline);
}
