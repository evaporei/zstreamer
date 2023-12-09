const std = @import("std");
const gst = @cImport({
    @cInclude("gst/gst.h");
});
const glib = @cImport({
    @cInclude("glib.h");
});
// const gst = c.gst;
// const glib = c.glib;

pub fn main() void {
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();

    // const args = try std.os.argsAlloc(allocator);
    // defer std.os.argsFree(allocator, args);
    //
    // gst.gst_init(args, args.len());
    // main.zig:17:27: error: expected type '[*c]c_int', found '[*][*:0]u8'
    gst.gst_init(@ptrCast(&std.os.argv.len), @ptrCast(&std.os.argv.ptr));
}
//
// var pipeline: gst.GstElement = undefined;
// _ = pipeline;
