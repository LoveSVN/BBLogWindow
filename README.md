# BBLogWindow
use it like this :

#ifdef DEBUG
#define BBLog(format, ...) NSLog(format, ## __VA_ARGS__);[[BBLogTool sharedManager] diplayLogStr:[NSString stringWithFormat:(@"[函数名:%s]\n" "[行号:%d] \n" format), __FUNCTION__, __LINE__, ##__VA_ARGS__]]
#else
#define BBLog(format, ...)
#endif


#ifdef DEBUG
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(showlogTool)];
#endif
