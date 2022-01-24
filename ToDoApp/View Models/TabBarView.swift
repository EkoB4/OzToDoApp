/*import SwiftUI
/*TodoListView()
 .tabItem {
     Image(systemName: "note.text.badge.plus").renderingMode(.template)*/
struct TabBarView : View {
    @StateObject var viewRouter : ViewRouter
    @Binding var selectedTab :String
    @State var tabPoint : [CGFloat] = []
    var body: some View{
        HStack(spacing: 0) {
            tabBarButtons(viewRouter: viewRouter, assignedPage: .home,icons: "house", selectedTab: $selectedTab,tabPoint:$tabPoint)
                
            tabBarButtons(viewRouter:viewRouter , assignedPage :.settings ,icons: "bookmark", selectedTab: $selectedTab,tabPoint:$tabPoint)
            
        }
        .padding(.horizontal)
        .background(
            Color.red
                .clipShape(PathCurve(tabPoint: setCurvePoint() - 15))
        )
        .overlay(Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
        .offset(x:setCurvePoint() - 20)
                 ,alignment: .bottomLeading)
        .cornerRadius(30)
        .padding()
        switch viewRouter.currentPage{
        case .home:
            Text("sa")
        case .settings:
            Text("as")
        }
    }
    func setCurvePoint()->CGFloat{
        if tabPoint.isEmpty{
            return 10
        }else{
            switch selectedTab{
            case "house":
                return tabPoint[0]
            case "bookmark":
                return tabPoint[1]
            default:
                return tabPoint[2]
            }
        }
    }
}

struct tabBarButtons : View {
    @StateObject var viewRouter:ViewRouter
    let assignedPage : Page
    var icons : String
    @Binding var selectedTab :String
    @Binding var tabPoint : [CGFloat]
    var body: some View{
        GeometryReader{reader -> AnyView in
            let midX = reader.frame(in:.global).midX
            DispatchQueue.main.async {
                if tabPoint.count<2{
                    tabPoint.append(midX)
                }
            }
            
            return AnyView(
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.2)) {
                        selectedTab = icons
                    }
                }) {
                    Image(systemName:"\(icons)\(selectedTab == icons  ? ".fill" : "")")
                        .font(.system(size: 25,weight: .semibold))
                        .foregroundColor(.blue)
                        .offset(y:selectedTab == icons ? -15 : 0)
                }
                .frame(maxWidth:.infinity,maxHeight:.infinity)
            )
        }
        .frame(height:60)
    }
}
struct testView : View {
    @State var selectedTab = "house"
    var body: some View{
        ZStack(alignment: .bottom){
            Color.red
                .ignoresSafeArea()
            TabBarView(viewRouter: ViewRouter(), selectedTab: $selectedTab)
        }
    }
}

struct PathCurve : Shape{
    var tabPoint : CGFloat

    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x:rect.width, y: 0))
            path.addLine(to: CGPoint(x:0, y: 0))
            path.addLine(to: CGPoint(x:0, y: rect.height))
            
            let mid = tabPoint
            
            path.move(to: CGPoint(x: mid - 55, y: rect.height))
            
            let to1 = CGPoint(x: mid, y: rect.height - 20)
            let control1 = CGPoint(x: mid - 15, y: rect.height)
            let control2 = CGPoint(x: mid - 15, y: rect.height - 20)
            
            let to2 = CGPoint(x: mid + 40, y: rect.height)
            let control3 = CGPoint(x: mid + 15, y: rect.height - 20)
            let control4 = CGPoint(x: mid + 25, y: rect.height)
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
        }
    }
}
struct TabBarView_Previews : PreviewProvider{
    static var previews: some View{
        testView()
    }
}
*/
