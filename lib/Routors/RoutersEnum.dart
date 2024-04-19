enum RoutersEnum {
  // HomePage
  container,
  text,
  image,
  icon,
  button,
  scaffold,
  appbar,
  dialog,
  key,
  animated,
  listView,
  gridView,
  pageView,
  get,
  // MePage
  padding,
  row,
  column,
  flex,
  stack0,
  stack1,
  wrap0,
  wrap1,
  aspectRation0,
  aspectRation1,
  aspectRation2,
}

String routerName(RoutersEnum routersEnum) {
  switch (routersEnum) {
    // HomePage
    case RoutersEnum.container:
      return '/home_Container';
    case RoutersEnum.text:
      return '/home_Text';
    case RoutersEnum.image:
      return '/home_Image';
    case RoutersEnum.icon:
      return '/home_Icon';
    case RoutersEnum.button:
      return '/home_Button';
    case RoutersEnum.scaffold:
      return '/home_Scaffold';
    case RoutersEnum.appbar:
      return '/home_AppBar';
    case RoutersEnum.dialog:
      return '/home_Dialog';
    case RoutersEnum.key:
      return '/home_Key';
    case RoutersEnum.animated:
      return '/home_Animated';
    case RoutersEnum.listView:
      return '/home_ListView';
    case RoutersEnum.gridView:
      return '/home_GridView';
    case RoutersEnum.pageView:
      return '/home_PageView';
    case RoutersEnum.get:
      return '/home_Get';
    // MePage
    case RoutersEnum.padding:
      return '/me_Padding';
    case RoutersEnum.row:
      return '/me_Row';
    case RoutersEnum.column:
      return '/me_Column';
    case RoutersEnum.flex:
      return '/me_Flex';
    case RoutersEnum.stack0:
      return '/me_Stack0';
    case RoutersEnum.stack1:
      return '/me_Stack1';
    case RoutersEnum.wrap0:
      return '/me_Wrap0';
    case RoutersEnum.wrap1:
      return '/me_Wrap1';
    case RoutersEnum.aspectRation0:
      return '/me_AspectRation0';
    case RoutersEnum.aspectRation1:
      return '/me_AspectRation1';
    case RoutersEnum.aspectRation2:
      return '/me_AspectRation2';
    default:
      return '';
  }
}

String routerTitle(RoutersEnum routersEnum) {
  switch (routersEnum) {
    // HomePage
    case RoutersEnum.container:
      return 'Container';
    case RoutersEnum.text:
      return 'Text';
    case RoutersEnum.image:
      return 'Image';
    case RoutersEnum.icon:
      return 'Icon';
    case RoutersEnum.button:
      return 'Button';
    case RoutersEnum.scaffold:
      return 'Scaffold';
    case RoutersEnum.appbar:
      return 'AppBar';
    case RoutersEnum.dialog:
      return 'Dialog';
    case RoutersEnum.key:
      return 'Key';
    case RoutersEnum.animated:
      return 'Animated';
    case RoutersEnum.listView:
      return 'ListView';
    case RoutersEnum.gridView:
      return 'GridView';
    case RoutersEnum.pageView:
      return 'PageView';
    case RoutersEnum.get:
      return 'Get';
    // MePage
    case RoutersEnum.padding:
      return 'Padding';
    case RoutersEnum.row:
      return 'Row';
    case RoutersEnum.column:
      return 'Column';
    case RoutersEnum.flex:
      return 'Flex';
    case RoutersEnum.stack0:
      return 'Stack0';
    case RoutersEnum.stack1:
      return 'Stack1';
    case RoutersEnum.wrap0:
      return 'Wrap0';
    case RoutersEnum.wrap1:
      return 'Wrap1';
    case RoutersEnum.aspectRation0:
      return 'AspectRation0';
    case RoutersEnum.aspectRation1:
      return 'AspectRation1';
    case RoutersEnum.aspectRation2:
      return 'AspectRation2';
    default:
      return '';
  }
}
