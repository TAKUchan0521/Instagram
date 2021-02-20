import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentLabel: UITextView!
    
    var receiveData: String!
    
    @IBAction func commentPostButton(_ sender: Any) {

        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        // FireStoreに投稿データを保存する
        if let commentText = commentLabel.text {
            var updateValue: FieldValue
            updateValue = FieldValue.arrayUnion([commentText])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(receiveData)
            postRef.updateData(["comment": updateValue])
        }

        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        self.dismiss(animated: true, completion: nil)
        
        SVProgressHUD.dismiss()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
