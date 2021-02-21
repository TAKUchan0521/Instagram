import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentLabel: UITextView!
    
    var receiveId: String!
    
    @IBAction func commentPostButton(_ sender: Any) {

        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        // FireStoreに投稿データを保存する
        if let commentText = commentLabel.text, let name = Auth.auth().currentUser?.displayName {
            var updateValue: FieldValue
            // updateValue = "\(postData.name!) : \(FieldValue.arrayUnion([commentText]))"
            updateValue = FieldValue.arrayUnion(["\(name) : \(commentText)"])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(receiveId)
            postRef.updateData(["comment": updateValue])
        }

        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        self.dismiss(animated: true, completion: nil)
        
        SVProgressHUD.dismiss()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
