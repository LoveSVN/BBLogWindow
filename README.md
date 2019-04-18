# BBLogWindow
use it like this :

#ifdef DEBUG 
<br/>#define BBLog(format, ...) NSLog(format, ## __VA_ARGS__);[[BBLogTool sharedManager] diplayLogStr:[NSString stringWithFormat:(@"[函数名:%s]\n" "[行号:%d] \n" format), __FUNCTION__, __LINE__, ##__VA_ARGS__]]
<br/>#else
<br/>#define BBLog(format, ...)
<br/>#endif


<br/>#ifdef DEBUG
    <br/>self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(showlogTool)];
<br/>#endif
