import SwiftUI

struct TabBarView :View {
    var body: some View{
        Home()
    }
}

struct Home:View{
    @State var selectedTab = "AddNote"
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var xPosition : CGFloat = 0
    
    @Namespace var IconAnimation
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){
                TodoListView()
                    .tag("AddNote")
                    .ignoresSafeArea(.all,edges: .all)
                    .environmentObject(ListViewModel())
                OptinionsScreen()
                    .tag("Settings")
                    .ignoresSafeArea(.all,edges: .all)
            }
            HStack(spacing:0){
                ForEach(iconArray, id:\.self){icons in
                    GeometryReader{reader in
                        Button(action: {
                            withAnimation(.spring()){
                                selectedTab = icons
                                xPosition = reader.frame(in: .global).minX
                            }
                        }) {
                            Image(icons)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode:.fit)
                                .frame(width:25,height: 25)
                                .foregroundColor(selectedTab == icons ? setIconColor(icon: icons):Color.gray)
                                .padding(selectedTab == icons ? 15 : 0)
                                .background(Color.white.opacity(selectedTab == icons ? 1: 0 ).clipShape(Circle()))
                                .matchedGeometryEffect(id: icons, in: IconAnimation)
                                .offset(x:reader.frame(in: .global).minX - reader.frame(in: .global).midX,y:selectedTab == icons ? -50 : 0)

                        }.onAppear {
                            if icons == iconArray.first{
                                xPosition = reader.frame(in: .global).minX
                            }
                        }
                    }
                    .frame(width:25,height: 25)
                    if icons != iconArray.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color("TabBarColor").clipShape(CustomShape(xPosition: xPosition)).cornerRadius(20))
            .padding()
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .ignoresSafeArea(.all,edges:.bottom)
    }
        
    func setIconColor(icon:String)->Color{
        switch icon{
        case "AddNote":
            return Color.brown
        case "Settings":
            return Color.green
        default:
            return Color.blue
        }
    }
}
var iconArray = ["AddNote","Settings"]
struct CustomShape :Shape{
    var xPosition : CGFloat
    var animatableData: CGFloat{
        get{return xPosition}
        set{xPosition = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xPosition
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x:center ,y:35)
            let control1 = CGPoint(x:center - 25 ,y:0)
            let control2 = CGPoint(x:center - 25,y:35)
            
            let to2 = CGPoint(x: center + 50,y:0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y:0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
        }
    }
}
struct TabBarView_Previews : PreviewProvider{
    static var previews: some View{
        TabBarView()
    }
}
