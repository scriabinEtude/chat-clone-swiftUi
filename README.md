# ChatApp Clone




<br/>

<img width="346" alt="intro" src="https://github.com/scriabinEtude/chat-clone-swiftUi/assets/47556543/2f081252-ae0e-4cb8-8990-f58b7f9c7396">

<br/><br/>

### 사용 라이브러리

- SwiftUI
- Firebase
- FirebaseStorage
- FirebaseFirestore
- Kingfisher

<br/><br/>

<details><summary><h1>Preview</h1></summary>

### 회원가입
  
  <br/>

https://github.com/scriabinEtude/chat-clone-swiftUi/assets/47556543/799cfb7f-855c-400e-b358-55a14582da9a

  <br/><br/>
  
### 채팅
  
  <br/>

https://github.com/scriabinEtude/chat-clone-swiftUi/assets/47556543/9ee6301a-271a-4c32-9faf-2e54640adc02

  <br/><br/>

### 로그인 및 채팅
  
  <br/>

https://github.com/scriabinEtude/chat-clone-swiftUi/assets/47556543/67497f2c-4e71-4a4d-a008-6ef79ef8dbfe

  <br/><br/>


</details>

<details><summary><h1>Features</h1></summary>

 <details><summary><h3>User Session</h3></summary>
   
   유저 세션을 유지하기 위해 유저 정보를 가지고 있는 객체를 싱글톤으로 관리합니다.\
   객체는 `ObservableObject`로 View 전반에서 접근 가능하도록 합니다.
   
  <br/>
   
  ```swift
  // 유저 세션 클래스
  class AuthViewModel: NSObject, ObservableObject {
    @Published var userSession: User?
    
    static let shared = AuthViewModel()
    ...
  }

  ```
   
  <br/>
   
  ```swift
  // 환경객체로 설정
  @main
  struct SwiftUIChatTutorialApp: App {

      var body: some Scene {
          WindowGroup {
              ContentsView().environmentObject(AuthViewModel.shared)
          }
      }
  }
  ```

  </details>
  
  <details><summary><h3>SwiftUI <-> UIKit</h3></summary>
    
  <br/>

  SwiftUI에서 UIKit의 UIViewController를 만들어 ImagePicker를 사용합니다.
    
  <br/>
    
  ```swift
  struct ImagePicker: UIViewControllerRepresentable {
      @Binding var image: UIImage?
      @Environment(\.presentationMode) var mode

      func makeUIViewController(context: Context) -> some UIViewController {
          let picker = UIImagePickerController()
          picker.delegate = context.coordinator
          return picker
      }

      func makeCoordinator() -> Coordinator {
          return Coordinator(self)
      }

      func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

      class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
          let parent: ImagePicker

          init(_ parent: ImagePicker){
              self.parent = parent
          }

          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              guard let image = info[.originalImage] as? UIImage else { return }
              self.parent.image = image
              self.parent.mode.wrappedValue.dismiss()
          }

      }
  }

    
  ```
  
  </details>

</details>

