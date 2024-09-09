import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica/src/model/transaction_model.dart';

FirebaseFirestore dataBase = FirebaseFirestore.instance;

Future<bool> validateUsers(String originUser, String destinationUser) async {
  try {
    CollectionReference collectionReference = dataBase.collection('user');
    QuerySnapshot querySnapshotOriginuser =
        await collectionReference.where('cc', isEqualTo: originUser).get();
    QuerySnapshot querySnapshotDestinationUser =
        await collectionReference.where('cc', isEqualTo: destinationUser).get();
    bool originuserRes = querySnapshotOriginuser.docs.isNotEmpty;
    bool destinationUserRes = querySnapshotDestinationUser.docs.isNotEmpty;
    if (originuserRes == true && destinationUserRes == true) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<(String texto, bool flag)> validateSourceAccountBalance(
    int amount, String originAccount, String ownerCC) async {
  try {
    CollectionReference collectionReference = dataBase.collection('account');
    QuerySnapshot querySnapshot = await collectionReference
        .where('accountNumber', isEqualTo: originAccount)
        .where('ownerCC', isEqualTo: ownerCC)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return (
        "El número de cuenta origen no coincide con la cédula del remitente",
        false
      );
    } else {
      Map<String, dynamic> bodyRespone =
          querySnapshot.docs.first.data()! as Map<String, dynamic>;
      int balance = bodyRespone['accountBalance'];

      if (balance < amount) {
        return ("Saldo insuficiente, por favor revise su saldo", false);
      } else {
        return ('', true);
      }
    }
  } catch (e) {
    return ('', false);
  }
}

Future<(String texto, bool flag)> validaeTargetAccount(
    String targetAccount, String destinationCard) async {
  try {
    CollectionReference collectionReference = dataBase.collection('account');
    QuerySnapshot querySnapshot = await collectionReference
        .where('accountNumber', isEqualTo: targetAccount)
        .where('ownerCC', isEqualTo: destinationCard)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return (
        "El número de cuenta destino no coincide con la cédula del destinatario",
        false
      );
    } else {
      return ('', true);
    }
  } catch (e) {
    return ('', false);
  }
}

Future validateTranfer({
  required String originUser,
  required String destinationUser,
  required int amount,
  required String ownerAccount,
  required String targetAccount,
}) async {
  try {
    final existUsers = await validateUsers(originUser, destinationUser);

    if (existUsers == false) {
      return (
        'Ups!! no encontramos a los usuarios, por favor revisa la cédula del remitente como la del destinatario',
        false
      );
    } else {
      final (String texto, sufficientAmount) =
          await validateSourceAccountBalance(amount, ownerAccount, originUser);

      if (sufficientAmount == true) {
        final (String texto_2, existUserDestination) =
            await validaeTargetAccount(targetAccount, destinationUser);

        if (existUserDestination == true) {
          final sendTransfer = await sendTransaction(
            originAccount: ownerAccount,
            destinationAccount: targetAccount,
            amount: amount,
            date: DateTime.now(),
          );
          final updateBalances = await updateBalancesAccount(
              ownerAccount, amount.toString(), targetAccount);
          if (sendTransfer && updateBalances) {
            return ('Transaccion realizada con exito', true);
          } else {
            throw Exception('Error al realizar la transaccion');
          }
        } else {
          return (texto_2, false);
        }
      } else {
        return (texto, sufficientAmount);
      }
    }
  } catch (e) {
    return ('Ups!! no se pudo realizar la transferencia', false);
  }
}

Future<bool> sendTransaction({
  required String originAccount,
  required String destinationAccount,
  required int amount,
  required DateTime date,
}) async {
  try {
    DocumentReference transactionRef =
        await dataBase.collection('transactions').add({
      'amountTranferred': amount,
      'date': date,
      'destinationAccount': destinationAccount,
      'originAccount': originAccount,
    });

    if (transactionRef.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<List<TransactionModel>> getTransactions() async {
  try {
    CollectionReference collectionReference =
        dataBase.collection('transactions');
    QuerySnapshot querySnapshot = await collectionReference.get();

    if (querySnapshot.docs.isNotEmpty) {
      List list = querySnapshot.docs
          .map((e) =>
              TransactionModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      list.sort((a, b) => b.date.compareTo(a.date));
      return list as List<TransactionModel>;
    }

    return [];
  } catch (e) {
    return [];
  }
}

Future<bool> updateBalancesAccount(
    String accountOrigin, String newBalance, String accountDestination) async {
  try {
    CollectionReference collectionReference = dataBase.collection('account');
    QuerySnapshot querySnapshotOriginAccount = await collectionReference
        .where('accountNumber', isEqualTo: accountOrigin)
        .get();
    QuerySnapshot querySnapshotDestinationAccount = await collectionReference
        .where('accountNumber', isEqualTo: accountDestination)
        .get();

    if (querySnapshotDestinationAccount.docs.isNotEmpty &&
        querySnapshotOriginAccount.docs.isNotEmpty) {
      final uidOriginAccount = querySnapshotOriginAccount.docs.first.id;
      final uidTargetAccount = querySnapshotDestinationAccount.docs.first.id;
      final currentBalanceOriginAccount = await dataBase
          .collection('account')
          .doc(uidOriginAccount)
          .get()
          .then((value) => value.data()!['accountBalance'] as int);
      final currentBalanceTargetAccount = await dataBase
          .collection('account')
          .doc(uidTargetAccount)
          .get()
          .then((value) => value.data()!['accountBalance'] as int);
      await dataBase.collection('account').doc(uidOriginAccount).update({
        'accountBalance': currentBalanceOriginAccount - int.parse(newBalance),
      });
      await dataBase.collection('account').doc(uidTargetAccount).update({
        'accountBalance': currentBalanceTargetAccount + int.parse(newBalance),
      });
    } else {
      throw Exception('Error al actualizar los saldos');
    }

    return true;
  } catch (e) {
    return false;
  }
}
