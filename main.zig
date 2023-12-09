const std = @import("std");
const gst = @cImport({
    @cInclude("gst/gst.h");
});
const glib = @cImport({
    @cInclude("glib.h");
});

pub fn main() void {
    gst.gst_init(@ptrCast(&std.os.argv.len), @ptrCast(&std.os.argv.ptr));
}
