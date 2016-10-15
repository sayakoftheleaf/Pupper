#import <Foundation/Foundation.h>
@interface Sockpuppet : NSObject <NSStreamDelegate> {
@public
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
}

- (void)setup:(NSString *)ip port:(int)port;
- (void)open;
- (void)close;
- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)event;



// read in
- (void)readIn:(NSString *)s;

// write out
- (void)writeOut:(NSString *)s;

@end
